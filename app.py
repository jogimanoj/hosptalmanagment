from flask import Flask, render_template, redirect, url_for, request
import mysql.connector

app = Flask(__name__)

# ---------- Database Connection ----------
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        port=3306,
        user="p1",                     # from your config
        password="your_password_here", # 🔒 replace with your actual password
        database="project"
    )

# ---------- Home ----------
@app.route('/')
def home():
    return render_template('home.html')

# ---------- Registration Flow ----------
@app.route('/registration')
def registration():
    return render_template('registration.html')

@app.route('/patient')
def patient():
    return render_template('patient.html')

# ---------- Login + Forgot Password ----------
@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/forgot')
def forgot():
    return render_template('forgot.html')

# ---------- Dashboards ----------
@app.route('/doctor_dashboard')
def doctor_dashboard():
    return render_template('doctor_dashboard.html')

@app.route('/patient_dashboard')
def patient_dashboard():
    return render_template('patient_dashboard.html')

@app.route('/lab_dashboard')
def lab_dashboard():
    return render_template('lab_dashboard.html')

@app.route('/admin_dashboard')
def admin_dashboard():
    return render_template('admin_dashboard.html')

# ---------- Nested Links ----------
@app.route('/patient_details')
def patient_details():
    return render_template('patient_details.html')

@app.route('/hospital_office')
def hospital_office():
    return render_template('hospital_office.html')

@app.route('/upload_report')
def upload_report():
    return render_template('upload_report.html')

# ---------- Example: View all patients ----------
@app.route('/show_patients')
def show_patients():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM patient")
    patients = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('show_patients.html', patients=patients)

# ---------- Run the App ----------
if __name__ == '__main__':
    app.run(debug=True)
