<div dir="rtl">
# פרויקט - הוראות התקנה והרצה

### דרישות מקדימות:
- **Node.js** (גרסה 14 ומעלה)
- **MySQL** (או כל מסד נתונים תואם)
- **NPM** (מנהל חבילות)

### שלב 1: התקנת תלותיות
בצע את הפקודות הבאות לכל אחד מהחלקים:
1. **Client**
   - גש לתיקיית ה-Client:
     ```bash
     cd client
     ```
   - התקן את התלויות:
     ```bash
     npm install
     ```

2. **Owner**
   - גש לתיקיית ה-Owner:
     ```bash
     cd owner
     ```
   - התקן את התלויות:
     ```bash
     npm install
     ```

3. **Server**
   - גש לתיקיית ה-Server:
     ```bash
     cd server
     ```
   - התקן את התלויות:
     ```bash
     npm install
     ```

4. **Portal**
   - גש לתיקיית ה-Portal:
     ```bash
     cd portal
     ```
   - התקן את התלויות:
     ```bash
     npm install
     ```

### שלב 2: הרצת החלקים השונים

בצע את הפעולות הבאות כדי להריץ כל אחד מהחלקים של הפרויקט.

1. **הרצת ה-Server**:
   - גש לתיקיית ה-Server והפעל את השרת:
     ```bash
     npm run start
     ```

2. **הרצת ה-Client**:
   - גש לתיקיית ה-Client והפעל את ה-Client:
     ```bash
     npm run start
     ```

3. **הרצת ה-Owner**:
   - גש לתיקיית ה-Owner והפעל את ה-Owner:
     ```bash
     npm run start
     ```

4. **הרצת ה-Portal**:
   - גש לתיקיית ה-Portal והפעל את ה-Portal:
     ```bash
     npm run start
     ```

### שלב 3: גישה למערכת

לאחר שהרצת את כל החלקים, תוכל לגשת למערכת דרך:

- ה-Client בכתובת: [http://localhost:3004](http://localhost:3004)
- ה-Owner בכתובת: [http://localhost:3002](http://localhost:3002)
- ה-Portal בכתובת: [http://localhost:3001](http://localhost:3001)


