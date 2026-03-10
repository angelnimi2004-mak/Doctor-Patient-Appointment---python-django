from django.db import models

# Login Model
class Login(models.Model):
    login_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50)
    password = models.TextField()
    Usertype = models.CharField(max_length=50)
    status = models.CharField(max_length=50)

    class Meta:
        db_table = 'tbl_login'


# User Registration Model
class UserRegister(models.Model):
    user_id = models.AutoField(primary_key=True)
    login = models.ForeignKey(Login, on_delete=models.CASCADE)
    Name = models.CharField(max_length=50)
    phone_number = models.BigIntegerField(null=True)
    Email = models.EmailField(max_length=50)
    Address = models.TextField()

    class Meta:
        db_table = 'tbl_user_register'


# Doctor Registration Model
class DoctorRegister(models.Model):
    d_id = models.AutoField(primary_key=True)
    login = models.ForeignKey(Login, on_delete=models.CASCADE)
    Name = models.CharField(max_length=50)
    department_name = models.CharField(max_length=50, null=True)
    phone_number = models.BigIntegerField(null=True)
    Email = models.EmailField(max_length=50)
    Address = models.TextField()
    status = models.CharField(max_length=50,null=True)

    class Meta:
        db_table = 'tbl_doctor_register'



class Consult(models.Model):
    c_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(UserRegister, on_delete=models.CASCADE)
    doctor = models.ForeignKey(DoctorRegister, on_delete=models.CASCADE, null=True)
    problem = models.CharField(max_length=50)
    reply = models.TextField(null=True, blank=True)
    medicines = models.TextField(null=True, blank=True) 
    date = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'tbl_consult'



# Booking Model
class Booking(models.Model):
    b_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(UserRegister, on_delete=models.CASCADE)
    item_name = models.CharField(max_length=50)
    booking_date = models.DateTimeField()
    amount=models.IntegerField(null=True,blank=True)
    status = models.CharField(max_length=50, choices=[('Pending', 'Pending'), ('Delivered', 'Delivered'), ('Not Available', 'Not Available')])

    class Meta:
        db_table = 'tbl_booking'


# Feedback Model
class Feedback(models.Model):
    fd_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(UserRegister, on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now_add=True)
    feedback = models.TextField()
    reply = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'tbl_feedback'


from django.db import models

class News(models.Model):
    news_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=100)  
    description = models.TextField() 
    date = models.DateTimeField(auto_now_add=True) 
    class Meta:
        db_table = 'tbl_News' 
