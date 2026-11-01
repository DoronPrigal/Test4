# Fruits REST API

REST API ב-Python וב-FastAPI שמחזיר מידע על פירות מ-[Fruityvice](https://www.fruityvice.com) ומתעד כל בקשה בטבלת `logs` במסד הנתונים `logs_db` ב-MySQL.

## דרישות מוקדמות
- Python 3.14 ומעלה
- Docker Desktop

## התקנה והרצה
הפקודות מיועדות ל-PowerShell ב-Windows ורצות מתיקיית הפרויקט.

1. יצירת קובץ ההגדרות (אפשר לשנות בו את הסיסמאות):
   ```powershell
   Copy-Item .env.example .env
   ```
2. הפעלת MySQL ב-Docker. הטבלה נוצרת אוטומטית בהרצה הראשונה:
   ```powershell
   docker compose up -d
   ```
3. יצירת סביבה וירטואלית והתקנת הספריות:
   ```powershell
   py -m venv env
   .\env\Scripts\python.exe -m pip install -r requirements.txt
   ```
4. הרצת השרת:
   ```powershell
   .\env\Scripts\python.exe -m uvicorn main:app --port 4000
   ```

MySQL צריך כמה שניות כדי לעלות בהרצה הראשונה. בקשה שנשלחת לפני כן תיכשל, כי לא ניתן לשמור את הלוג שלה.

## Endpoints
| Method | נתיב | תיאור |
|---|---|---|
| GET | `/api/fruits` | כל הפירות |
| GET | `/api/search/{text}` | פירות ששמם מכיל את הטקסט, בלי תלות באותיות גדולות או קטנות |
| GET | `/api/calories/{max}` | פירות עם ערך קלורי קטן או שווה ל-`max` |

תיעוד Swagger: http://localhost:4000/docs

### קודי שגיאה
- `422`: ערך `max` שאינו מספר שלם או שהוא שלילי.
- `502`: ה-API של Fruityvice אינו זמין.

## טבלת `logs`
| עמודה | תיאור |
|---|---|
| `method` | ה-Method של הבקשה |
| `route` | הנתיב המלא, כולל ערך הפרמטר |
| `total_results` | מספר האובייקטים שהוחזרו במערך התגובה |
| `client_ip` | כתובת ה-IP של הלקוח |
| `created_at` | תאריך ושעת הבקשה |

כל בקשה שמתחילה ב-`/api` נרשמת, גם אם נכשלה. בבקשה שנכשלה `total_results` הוא 0.

## קבצים נוספים
- `postman_collection.json`: אוסף הבקשות לייבוא ל-Postman.
- `db_export.sql`: ייצוא מסד הנתונים, כולל המבנה והנתונים.

ייבוא הייצוא למסד נתונים פועל:
```powershell
Get-Content db_export.sql -Raw | docker exec -i fruits_mysql sh -c 'mysql -uroot -p$MYSQL_ROOT_PASSWORD logs_db'
```
