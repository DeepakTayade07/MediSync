# 🔧 Login Troubleshooting Guide

## Issue: "Nothing happens when I click login"

---

## ✅ Quick Diagnosis

### **Step 1: Open Test Page**
Open `test-login.html` in your browser to diagnose the issue.

This page will:
- ✅ Check if backend is running
- ✅ Test the login API
- ✅ Show detailed console output
- ✅ Display any errors

---

## 🔍 Common Issues & Solutions

### **Issue 1: Backend Not Running**

**Symptoms:**
- Nothing happens when clicking login
- No error message appears
- Browser console shows "Failed to fetch" or "Network error"

**Solution:**
```bash
# Open PowerShell in backend folder
cd "c:\Mini project\chatgpt2 healthcare\backend"

# Kill any process on port 5000
powershell -ExecutionPolicy Bypass -File kill-port-5000.ps1

# Start the server
npm start
```

**Expected Output:**
```
🚀 Server running on http://localhost:5000
✅ MongoDB Connected Successfully
```

---

### **Issue 2: MongoDB Not Running**

**Symptoms:**
- Backend starts but crashes immediately
- Error: "MongoDB Connection Error"

**Solution:**
```bash
# Start MongoDB (Run as Administrator)
net start MongoDB

# Or use MongoDB Compass to start it
```

---

### **Issue 3: CORS Error**

**Symptoms:**
- Browser console shows: "CORS policy blocked"
- Backend is running but login fails

**Solution:**
Backend already has CORS enabled. If you still see this error:
1. Make sure you're opening the HTML file via a web server (not file://)
2. Use Live Server extension in VS Code
3. Or use: `python -m http.server 8000`

---

### **Issue 4: Wrong Credentials**

**Symptoms:**
- Login button works but shows "Invalid credentials"

**Solution:**
Use the correct test credentials:

**Patients:**
- Email: `john@test.com`
- Password: `password123`

**Doctors:**
- Email: `dr.sarah@medisync.com`
- Password: `doctor123`

---

### **Issue 5: Database Not Seeded**

**Symptoms:**
- Login shows "User not found"
- No test users exist

**Solution:**
```bash
cd backend
node seedData.js
```

---

## 🧪 Step-by-Step Testing

### **Test 1: Check Backend**
```bash
# In PowerShell
Invoke-WebRequest -Uri http://localhost:5000/api/doctors -Method GET
```

**Expected:** Should return JSON with doctors list

---

### **Test 2: Test Login API Directly**
```bash
# In PowerShell
$body = @{
    email = "john@test.com"
    password = "password123"
} | ConvertTo-Json

Invoke-WebRequest -Uri http://localhost:5000/api/auth/patient/login `
    -Method POST `
    -ContentType "application/json" `
    -Body $body
```

**Expected:** Should return token and user data

---

### **Test 3: Check Browser Console**

1. Open `patient_login.html`
2. Press `F12` to open Developer Tools
3. Go to **Console** tab
4. Try to login
5. Check for errors

**Common Errors:**
- `loginPatient is not defined` → api.js not loaded
- `Failed to fetch` → Backend not running
- `CORS error` → Need to use web server
- `401 Unauthorized` → Wrong credentials

---

### **Test 4: Check Network Tab**

1. Open Developer Tools (`F12`)
2. Go to **Network** tab
3. Try to login
4. Look for the request to `/api/auth/patient/login`

**What to check:**
- **Status Code:** Should be 200 (success) or 401 (wrong credentials)
- **Response:** Should contain token and user data
- **Request Payload:** Should contain email and password

---

## 🛠️ Manual Fix Steps

### **If Nothing Works:**

1. **Kill all Node processes:**
```bash
Get-Process node | Stop-Process -Force
```

2. **Restart MongoDB:**
```bash
net stop MongoDB
net start MongoDB
```

3. **Clear browser cache:**
- Press `Ctrl + Shift + Delete`
- Clear cached images and files
- Clear cookies and site data

4. **Reinstall dependencies:**
```bash
cd backend
rm -r node_modules
rm package-lock.json
npm install
```

5. **Reseed database:**
```bash
node seedData.js
```

6. **Start fresh:**
```bash
npm start
```

---

## 📋 Checklist

Before testing login, make sure:

- [ ] MongoDB is running
- [ ] Backend server is running on port 5000
- [ ] Database has been seeded with test data
- [ ] You're using correct test credentials
- [ ] Browser console shows no errors
- [ ] You're opening HTML via web server (not file://)
- [ ] api.js file is loaded (check console for "API module loaded")

---

## 🔍 Debug Mode

### **Enable Detailed Logging:**

Add this to the top of `patient_login.html` script section:

```javascript
console.log('Page loaded');
console.log('API_URL:', API_URL);
console.log('loginPatient function:', typeof loginPatient);

// Test if api.js is loaded
if (typeof loginPatient === 'undefined') {
    console.error('❌ api.js not loaded!');
    alert('Error: API module not loaded. Check console.');
}
```

---

## 🎯 Quick Test Commands

### **Test Backend:**
```bash
curl http://localhost:5000/api/doctors
```

### **Test Login:**
```bash
curl -X POST http://localhost:5000/api/auth/patient/login `
  -H "Content-Type: application/json" `
  -d '{"email":"john@test.com","password":"password123"}'
```

### **Check Port 5000:**
```bash
Get-NetTCPConnection -LocalPort 5000
```

### **View Backend Logs:**
```bash
# Backend should show requests like:
POST /api/auth/patient/login
GET /api/doctors
```

---

## 💡 Pro Tips

1. **Always check browser console first** - Most errors show there
2. **Use test-login.html** - It shows detailed diagnostics
3. **Check Network tab** - See actual API requests/responses
4. **Verify backend logs** - Backend should log each request
5. **Use MongoDB Compass** - Verify data exists in database

---

## 📞 Still Not Working?

### **Collect This Information:**

1. **Browser Console Errors:**
   - Press F12 → Console tab
   - Copy any red errors

2. **Network Tab:**
   - Press F12 → Network tab
   - Try login
   - Check if request to `/api/auth/patient/login` appears
   - Check status code and response

3. **Backend Logs:**
   - Check terminal where `npm start` is running
   - Copy any error messages

4. **System Info:**
   - Node version: `node --version`
   - MongoDB status: `net start MongoDB`
   - Port 5000 status: `Get-NetTCPConnection -LocalPort 5000`

---

## ✅ Success Indicators

When everything works correctly:

1. ✅ Backend shows: `POST /api/auth/patient/login`
2. ✅ Browser console shows: `✅ API module loaded successfully`
3. ✅ Network tab shows: Status 200 for login request
4. ✅ Alert shows: "Login successful! Redirecting..."
5. ✅ Page redirects to `patient_dashboard_new.html`
6. ✅ Dashboard loads with user data

---

**Last Updated:** October 16, 2025  
**Status:** Troubleshooting Guide
