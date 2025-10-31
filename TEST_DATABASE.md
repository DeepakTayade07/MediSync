# Testing Database Integration

This guide will help you test the automatic database storage feature.

## Prerequisites

✅ MongoDB installed and running
✅ Node.js installed
✅ Backend dependencies installed (`npm install` in backend folder)

## Step-by-Step Testing

### Step 1: Start MongoDB

**Windows:**
```powershell
# Check if MongoDB is running
Get-Service MongoDB

# If not running, start it
net start MongoDB
```

**Mac/Linux:**
```bash
# Start MongoDB
brew services start mongodb-community
# or
sudo systemctl start mongod
```

### Step 2: Start Backend Server

```powershell
# Navigate to backend folder
cd "c:\Mini project\chatgpt2 healthcare\backend"

# Start the server
npm start
```

**Expected Output:**
```
==================================================
🚀 Server running in development mode
📡 Server URL: http://localhost:5000
📚 API Documentation: http://localhost:5000/
==================================================
✅ MongoDB Connected: localhost
📊 Database Name: medisync
```

### Step 3: Test Contact Form

1. **Open contact.html** in your browser
   - Right-click `contact.html` → Open with Live Server
   - Or open directly in browser

2. **Fill out the form:**
   - First Name: John
   - Last Name: Doe
   - Email: john.doe@example.com
   - Phone: 555-123-4567
   - Subject: General Inquiry
   - Message: Testing the contact form
   - ✅ Check the consent checkbox

3. **Submit the form**
   - Click "Send Message"
   - You should see a success message

4. **Verify in Database:**
   ```powershell
   # Open MongoDB shell
   mongosh
   
   # Switch to medisync database
   use medisync
   
   # View the submitted message
   db.contactmessages.find().pretty()
   ```

**Expected Result:**
```json
{
  "_id": ObjectId("..."),
  "firstName": "John",
  "lastName": "Doe",
  "email": "john.doe@example.com",
  "phone": "555-123-4567",
  "subject": "General Inquiry",
  "message": "Testing the contact form",
  "status": "new",
  "priority": "medium",
  "consentGiven": true,
  "createdAt": ISODate("2025-10-06T..."),
  "updatedAt": ISODate("2025-10-06T...")
}
```

### Step 4: Test Appointment Booking

1. **Open book.html** in your browser

2. **Fill out the form:**
   - **Personal Information:**
     - First Name: Jane
     - Last Name: Smith
     - Email: jane.smith@example.com
     - Phone: 555-987-6543
     - Date of Birth: 1990-01-15
     - Gender: Female
   
   - **Patient Status:**
     - New Patient: Yes, I'm a new patient
     - Appointment Type: Video Consultation
   
   - **Medical Details:**
     - Specialty: Cardiology
     - Doctor: (Select from dropdown)
     - Reason: Chest pain and shortness of breath
   
   - **Schedule:**
     - Date: (Select future date)
     - Time: 10:00 AM
   
   - ✅ Check Terms & Conditions

3. **Submit the form**
   - Click "Confirm Appointment"
   - You should see a success message

4. **Verify in Database:**
   ```powershell
   # View appointments
   db.appointments.find().pretty()
   
   # View newly created patient
   db.patients.find().pretty()
   ```

## Testing API Endpoints Directly

### Test Contact API with PowerShell

```powershell
# Test POST /api/contact
$body = @{
    firstName = "Test"
    lastName = "User"
    email = "test@example.com"
    phone = "555-000-0000"
    subject = "General Inquiry"
    message = "This is a test message"
    consent = $true
} | ConvertTo-Json

Invoke-RestMethod -Uri "http://localhost:5000/api/contact" -Method POST -Body $body -ContentType "application/json"
```

### Test with cURL (if installed)

```bash
# Test contact form
curl -X POST http://localhost:5000/api/contact \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "Test",
    "lastName": "User",
    "email": "test@example.com",
    "phone": "555-000-0000",
    "subject": "General Inquiry",
    "message": "This is a test message",
    "consent": true
  }'
```

## Viewing All Data

### View All Collections

```javascript
// In mongosh
use medisync

// List all collections
show collections

// Count documents in each collection
db.contactmessages.countDocuments()
db.appointments.countDocuments()
db.patients.countDocuments()
db.doctors.countDocuments()
```

### View Recent Submissions

```javascript
// Last 5 contact messages
db.contactmessages.find().sort({ createdAt: -1 }).limit(5).pretty()

// Last 5 appointments
db.appointments.find().sort({ createdAt: -1 }).limit(5).pretty()

// All new contact messages
db.contactmessages.find({ status: "new" }).pretty()

// All pending appointments
db.appointments.find({ status: "pending" }).pretty()
```

## Common Issues and Solutions

### Issue 1: "Cannot connect to backend"

**Symptoms:**
- Form submission fails
- Error in browser console: "Failed to fetch"

**Solution:**
1. Check if backend is running: `http://localhost:5000`
2. Check if MongoDB is running
3. Verify API_BASE_URL in JavaScript files

### Issue 2: "CORS error"

**Symptoms:**
- Error: "Access to fetch blocked by CORS policy"

**Solution:**
Update `backend/server.js`:
```javascript
app.use(cors({
  origin: '*', // Allow all origins for testing
  credentials: true,
}));
```

### Issue 3: "Validation error"

**Symptoms:**
- Form doesn't submit
- Error message about required fields

**Solution:**
1. Check all required fields are filled
2. Check email format is valid
3. Check consent checkbox is checked

### Issue 4: "Database not saving data"

**Symptoms:**
- Success message appears but data not in database

**Solution:**
1. Check backend console for errors
2. Verify MongoDB connection string in `.env`
3. Check database name is correct
4. Try: `db.contactmessages.find()` in mongosh

## Browser Console Testing

Open browser console (F12) and test:

```javascript
// Test contact form submission
fetch('http://localhost:5000/api/contact', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    firstName: 'Console',
    lastName: 'Test',
    email: 'console@test.com',
    phone: '555-111-2222',
    subject: 'General Inquiry',
    message: 'Testing from console',
    consent: true
  })
})
.then(res => res.json())
.then(data => console.log('Success:', data))
.catch(err => console.error('Error:', err));
```

## Monitoring in Real-Time

### Watch MongoDB Changes

```javascript
// In mongosh - watch for new contact messages
use medisync
db.contactmessages.watch()

// In another terminal, submit a form and see it appear in real-time
```

### Watch Backend Logs

Keep the backend terminal open to see:
- Incoming requests
- Database operations
- Errors (if any)

## Success Checklist

After testing, you should have:

- ✅ Backend server running without errors
- ✅ MongoDB connected successfully
- ✅ Contact form submits and saves to database
- ✅ Appointment form submits and saves to database
- ✅ Data visible in MongoDB (using mongosh or Compass)
- ✅ Success messages appear in frontend
- ✅ No CORS errors in browser console

## Next Steps

Once testing is successful:

1. **Add more doctors** to the database for testing appointments
2. **Create admin panel** to view all submissions
3. **Add email notifications** for new submissions
4. **Implement authentication** for existing patients
5. **Add data export** functionality

## Sample Data for Testing

### Add Sample Doctors

```javascript
// In mongosh
use medisync

db.doctors.insertMany([
  {
    name: "Sarah Johnson",
    email: "dr.sarah@medisync.com",
    password: "$2b$10$...", // Use hashed password
    specialization: "Cardiology",
    phone: "555-100-0001",
    licenseNumber: "MD12345",
    yearsOfExperience: 15,
    consultationFee: 150,
    isAvailable: true,
    isVerified: true
  },
  {
    name: "Michael Chen",
    email: "dr.chen@medisync.com",
    password: "$2b$10$...",
    specialization: "Dermatology",
    phone: "555-100-0002",
    licenseNumber: "MD12346",
    yearsOfExperience: 10,
    consultationFee: 120,
    isAvailable: true,
    isVerified: true
  }
])
```

## Support

If you encounter any issues:

1. Check backend console for error messages
2. Check browser console (F12) for frontend errors
3. Review `DATABASE_SETUP_GUIDE.md` for detailed information
4. Check MongoDB logs
5. Verify all environment variables in `.env`

## Clean Up Test Data

To remove test data:

```javascript
// In mongosh
use medisync

// Delete all contact messages
db.contactmessages.deleteMany({})

// Delete all appointments
db.appointments.deleteMany({})

// Delete all patients
db.patients.deleteMany({})

// Or delete specific test entries
db.contactmessages.deleteMany({ email: "test@example.com" })
```
