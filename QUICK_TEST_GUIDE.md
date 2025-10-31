# ⚡ Quick Test Guide - Frontend-Backend Connection

## 🚀 3-Minute Quick Start

### Step 1: Start Backend (30 seconds)
```bash
cd backend
npm start
```

**Wait for:**
```
✅ MongoDB Connected Successfully
🚀 Server running on http://localhost:5000
```

---

### Step 2: Test Connection (1 minute)

Open in browser: `test-connection.html`

**Expected Results:**
- ✅ Backend Server Status: Connected
- ✅ Database Connection: Connected
- ✅ CORS Configuration: Working
- ✅ API Endpoints: Working

---

### Step 3: Test Login (1 minute)

#### Option A: Create Test User via MongoDB Compass

1. Open MongoDB Compass
2. Connect to `mongodb://localhost:27017`
3. Go to `medisync` database → `patients` collection
4. Insert document:
```json
{
  "name": "Test Patient",
  "email": "test@test.com",
  "password": "$2a$10$YourHashedPasswordHere",
  "phone": "1234567890",
  "dateOfBirth": "1990-01-01",
  "gender": "male"
}
```

#### Option B: Use Backend API to Register

Open browser console on any page and run:
```javascript
fetch('http://localhost:5000/api/auth/register', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    name: 'Test Patient',
    email: 'test@test.com',
    password: 'password123',
    phone: '1234567890',
    dateOfBirth: '1990-01-01',
    gender: 'male'
  })
}).then(r => r.json()).then(console.log);
```

#### Test Login:
1. Go to `patient_login.html`
2. Email: `test@test.com`
3. Password: `password123`
4. Click Login
5. Should redirect to dashboard ✅

---

## 🎯 Quick Feature Tests

### Test 1: Contact Form (30 seconds)
1. Open `contact.html`
2. Fill form
3. Submit
4. Check MongoDB → `contacts` collection ✅

### Test 2: View Doctors (30 seconds)
1. Open `doctors.html`
2. Should load doctors from database ✅

### Test 3: Book Appointment (1 minute)
1. Open `book.html`
2. Select specialty → loads doctors ✅
3. Fill form
4. Submit
5. Check MongoDB → `appointments` collection ✅

---

## 🐛 Quick Troubleshooting

### Problem: "Failed to fetch"
**Solution:** Backend not running
```bash
cd backend
npm start
```

### Problem: "No doctors loading"
**Solution:** Add test doctor to database
```javascript
// Run in browser console
fetch('http://localhost:5000/api/doctors', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    name: 'Dr. John Smith',
    email: 'doctor@test.com',
    password: 'password123',
    specialization: 'Cardiology',
    phone: '1234567890',
    licenseNumber: 'MD12345'
  })
}).then(r => r.json()).then(console.log);
```

### Problem: "Login not working"
**Solution:** Check browser console (F12) for errors

---

## ✅ Success Checklist

- [ ] Backend server running
- [ ] MongoDB running
- [ ] Test connection page shows all green
- [ ] Can login successfully
- [ ] Forms submit without errors
- [ ] Data appears in MongoDB

---

## 📞 Need Help?

1. Check `FRONTEND_BACKEND_FIX.md` for detailed guide
2. Check `CONNECTION_STATUS.md` for connection details
3. Open `test-connection.html` to diagnose issues
4. Check browser console (F12) for errors
5. Check backend terminal for server errors

---

**Quick Reference:**
- Backend URL: `http://localhost:5000`
- API Base: `http://localhost:5000/api`
- Test Page: `test-connection.html`
- MongoDB: `mongodb://localhost:27017/medisync`
