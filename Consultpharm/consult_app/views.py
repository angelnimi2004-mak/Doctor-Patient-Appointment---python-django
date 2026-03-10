from django.shortcuts import render,HttpResponse,redirect,get_object_or_404
from .models import *
from django.db.models import Q
from django.contrib import messages
from django.contrib.auth import authenticate
from datetime import date,datetime,timedelta
from django.contrib.auth import logout
from django.utils.timezone import now

# Create your views here.
today = date.today()





def index(request):
    return render(request,'index.html')

def about(request):
    return render(request,'about.html')


def user_login(request):
    return render(request,'login.html')

def user_registration(request):
    return render(request,'user_registration.html')

def login_action(request):
    u=request.POST.get("username")
    p=request.POST.get("password")
    obj=authenticate(username=u,password=p)
    if obj is not None:
        if obj.is_superuser == 1:
            request.session['aname'] = u
            request.session['slogid'] = obj.id
            return redirect('admin_home')
        else:
          messages.add_message(request, messages.INFO, 'Invalid User.')
          return redirect('user_login')
    else:
        newp=p
        try:
            obj1=Login.objects.get(username=u,password=newp)

            if obj1.Usertype=="User":
                if(obj1.status=="Approved"):
                    request.session['uname'] = u
                    request.session['slogid'] = obj1.login_id
                    return redirect('user_home')
                elif(obj1.status=="Not Approved"):
                  messages.add_message(request, messages.INFO, 'Waiting For Approval.')
                  return redirect('user_login')
                else:
                  messages.add_message(request, messages.INFO, 'Invalid User.')
                  return redirect('user_login')
                
            elif obj1.Usertype=="Doctor":
                if(obj1.status=="Approved"):
                    request.session['dname'] = u
                    request.session['slogid'] = obj1.login_id
                    return redirect('doctor_home')
                elif(obj1.status=="Not Approved"):
                  messages.add_message(request, messages.INFO, 'Waiting For Approval.')
                  return redirect('user_login')
                else:
                  messages.add_message(request, messages.INFO, 'Invalid User.')
                  return redirect('user_login')
            else:
                 messages.add_message(request, messages.INFO, 'Invalid User.')
                 return redirect('user_login')
        except Login.DoesNotExist:
         messages.add_message(request, messages.INFO, 'Invalid User.')
         return redirect('user_login') 
        
def user_action(request):
   
    username=request.POST.get("username")
    data = {
       'username_exists':      Login.objects.filter(username=username).exists(),
        'error':"Username Already Exist"
    }
    if(data["username_exists"]==False):
        tbl1=Login()
        username=request.POST.get("username")
        tbl1.username=request.POST.get("username")
        password=request.POST.get("password")
        tbl1.password=password
        tbl1.Usertype="User"
        tbl1.status="Approved"
        tbl1.save()
        obj=Login.objects.get(username=username,password=password)

        u=UserRegister()

        u.login_id = obj.login_id
        u.Name=request.POST.get("Name")
        u.phone_number =request.POST.get("phone")
        u.Email=request.POST.get("Email")
        u.Address=request.POST.get("Address")
        u.save()
        messages.add_message(request, messages.INFO, 'Registered successfully.')
        return redirect('user_registration')
    else:
        messages.add_message(request, messages.INFO, 'User name is already Exist. Sorry Registration Failed.')
        return redirect('user_registration')


def doctor_reg(request):
    return render(request,'master/dr_reg.html')


def doctor_action(request):
    username = request.POST.get("username")
    data = {
        'username_exists': Login.objects.filter(username=username).exists(),
        'error': "Username Already Exists"
    }
    
    if not data["username_exists"]:
       
        tbl1 = Login()
        tbl1.username = username
        tbl1.password = request.POST.get("password")
        tbl1.Usertype = "Doctor"
        tbl1.status = "Approved"
        tbl1.save()
        
        
        obj = Login.objects.get(username=username, password=tbl1.password)
        
        
        w = DoctorRegister()
        w.login = obj
        w.Name = request.POST.get("name")
        w.department_name = request.POST.get("department")
        w.phone_number = request.POST.get("phone")
        w.Email = request.POST.get("email")
        w.Address = request.POST.get("address")
        w.save()
        
        messages.add_message(request, messages.INFO, 'Doctor registered successfully.')
        return redirect('doctor_reg')
    else:
        messages.add_message(request, messages.INFO, 'Username already exists. Sorry, registration failed.')
        return redirect('doctor_reg')


   

    
def admin_logout(request):
    logout(request)
    request.session.delete()
    return redirect('user_login')


def user_logout(request):
    logout(request)
    request.session.delete()
    return redirect('user_login')


def admin_home(request):
    if 'aname' in request.session:
     return render(request,'Master/index.html')
    else:
      return redirect('user_login')
    
def doctor_home(request):
    if 'dname' in request.session:
     data=DoctorRegister.objects.get(login_id= request.session['slogid'])
     request.session['doctor_id']=data.d_id
     return render(request,'doctor/index.html')
    else:
      return redirect('user_login')
    
    
def dr_list(request):
    if 'aname' in request.session:
     data=DoctorRegister.objects.all()
     return render(request,'Master/dr_list.html',{'data':data})
    else:
      return redirect('user_login')   
    

def delete_dr(request):
   if 'aname' in request.session:
         if "login_id" in request.GET:
            try:
                obj=Login.objects.get(login_id=request.GET.get("login_id"))
                obj.delete()
                messages.success(request,'Deleted successfull')
                return redirect('dr_list')
            except Exception:
                return redirect('dr_list')
         else:
                return redirect('dr_list')
   else:
      return redirect('user_login')




def dr_profile(request):
    if 'dname' not in request.session:
        return redirect('user_login')

    log_id = request.session['slogid']
    try:
        doctor = DoctorRegister.objects.get(login_id=log_id)

        if request.method == 'POST':
            # Update the doctor's profile
            doctor.Name = request.POST.get("Name")
            doctor.Email = request.POST.get("Email")
            doctor.phone_number = request.POST.get("phone_number")
            doctor.Address = request.POST.get("Address")
            
            # Update availability status based on the dropdown selection
            doctor.status = request.POST.get("availability")
            
            doctor.save()
            messages.success(request, 'Profile updated successfully!')
            return redirect('dr_profile')

        return render(request, 'doctor/dr_profile.html', {'data': doctor})

    except DoctorRegister.DoesNotExist:
        messages.error(request, 'Doctor not found')
        return redirect('user_login')


         
def user_home(request):
    if 'uname' in request.session:
     data=UserRegister.objects.get(login_id= request.session['slogid'])
     request.session['user_id']=data.user_id
     return render(request,'User/index.html')
    else:
      return redirect('user_login')   
    



def view_dr(request):
    if 'uname' in request.session:
        search_query = request.GET.get('search', '')

        if search_query:
            dr = DoctorRegister.objects.filter(
                Name__icontains=search_query) | DoctorRegister.objects.filter(department_name__icontains=search_query)
        else:
            dr = DoctorRegister.objects.all()
        return render(request, 'User/view_dr.html', {'dr': dr, 'search': search_query})
    else:
        return redirect('user_login')
    



def consult_withdr(request):
    if 'uname' not in request.session:
        return redirect('user_login')

    user = get_object_or_404(UserRegister, user_id=request.session['user_id'])


    if request.method == "POST":
        problem = request.POST.get('problem')

        d_id = request.POST.get("d_id")

        doctor = get_object_or_404(DoctorRegister, d_id=d_id)
        
        Consult.objects.create(
            user=user, 
            doctor=doctor,
            problem=problem,
            date=now()
        )

        messages.success(request, "Consultation request submitted successfully!")
        return redirect('view_dr')
    dr=DoctorRegister.objects.get(d_id=request.GET.get('d_id'))
    return render(request, 'user/consult.html', {'dr':dr, 'user': user})




def view_problem(request):
    if 'dname' not in request.session:
        return redirect('user_login')

    doctor_login_id = request.session['slogid']
    # print(f"Doctor login ID: {doctor_login_id}")

    try:
        doctor = DoctorRegister.objects.get(login__login_id=doctor_login_id)
        doctor_id = doctor.d_id
        # print(f"Doctor ID: {doctor_id}")
    except DoctorRegister.DoesNotExist:
        # print("Doctor not found")
        return redirect('user_login')  

    # Filter to get items where reply is NULL
    data = Consult.objects.filter(doctor=doctor_id, reply__isnull=True)
    return render(request, 'doctor/view_problem.html', {'data': data})


def completed_problem(request):
    if 'dname' not in request.session:
        return redirect('user_login')

    doctor_login_id = request.session['slogid']

    try:
        doctor = DoctorRegister.objects.get(login__login_id=doctor_login_id)
        doctor_id = doctor.d_id
    except DoctorRegister.DoesNotExist:
        return redirect('user_login')

    data = Consult.objects.filter(doctor=doctor_id).exclude(reply__isnull=True).exclude(reply='')
    return render(request, 'doctor/completed.html', {'data': data})




def reply(request):
    if 'dname' in request.session:
        if request.method == 'POST':
            c_id = request.POST['c_id']
            reply = request.POST['reply']
            medicines = request.POST.get('medicines')
            Consult.objects.filter(c_id=c_id).update(reply=reply,medicines = medicines)
            messages.success(request, 'Submitted successfully')
            return redirect('view_problem')
        else:
            return redirect('view_problem')
    else:
        return redirect('user_home')
    


def consult_history(request):
    if 'uname' not in request.session:
        return redirect('user_login')
    user = get_object_or_404(UserRegister, user_id=request.session['user_id'])
    data=Consult.objects.filter(user_id=user)
    return render(request,'user/c_history.html', {'data': data})



# def order_medicine(request):
#     if 'uname' not in request.session:
#         return redirect('user_login')
#     return render(request,'user/buy.html')







def buy_medicines(request):
    if 'uname' not in request.session:
        return redirect('user_login')

    user = get_object_or_404(UserRegister, user_id=request.session['user_id'])

    if request.method == 'POST':
        medicine_input = request.POST.get('medicines')
        
        if not medicine_input:
            messages.error(request, 'Please provide at least one medicine.')
            return redirect('buy_medicines')  

        # Check if the user has already ordered the same medicine on the same day
        today = datetime.now().date()
        existing_booking = Booking.objects.filter(
            user=user,
            item_name=medicine_input,
            booking_date__date=today,  
            status='Pending'
        ).exists()

        if existing_booking:
            messages.error(request, 'You have already ordered this medicine today.')
            return redirect('buy_medicines')  

        # Create a new booking
        booking = Booking(
            user=user,
            item_name=medicine_input,  
            booking_date=datetime.now(),
            status='Pending', 
        )
        booking.save()
        
        messages.success(request, 'You have successfully ordered the medicines!')
        messages.info(request, 'Please pay the amount when the medicine arrives.')

        return redirect('buy_medicines')  

    return render(request, 'user/buy.html')



def view_order(request):
    if 'aname' not in request.session:
        return redirect('user_login')

    if request.method == 'POST':
        b_id = request.POST.get('b_id') 
        booking = get_object_or_404(Booking, b_id=b_id) 
        amount = request.POST.get('amount')
        status = request.POST.get('status')

        try:
            booking.amount = float(amount)  # Convert to float
        except ValueError:
            booking.amount = 0.0  # Set amount to 0 if it's invalid

        booking.status = status
        booking.save()
        messages.success(request, 'Booking updated successfully.')
        return redirect('view_order')

    data = Booking.objects.filter(status='Pending')
    return render(request, 'master/view_order.html', {'data': data})



def c_order(request):
    if 'aname' not in request.session:
        return redirect('user_login')

    data = Booking.objects.filter(status="Delivered")
    return render(request, 'master/c_order.html', {'data': data})




def purchase_history(request):
    if 'uname' not in request.session:
        return redirect('user_login')

    user = get_object_or_404(UserRegister, user_id=request.session['user_id'])

    data = Booking.objects.filter(status="Delivered", user=user)
    return render(request, 'user/purchase_history.html', {'data': data})



def feedback(request):
    if 'uname' not in request.session:
        return redirect('user_login')  # Redirect to login if the session does not contain 'uname'

    try:
        user = UserRegister.objects.get(login_id=request.session['slogid'])
    except UserRegister.DoesNotExist:
        messages.error(request, "User not found.")
        return redirect('user_login')

    if request.method == 'POST':
        feedback_text = request.POST.get("feedback")
        if feedback_text:
            # Create a new feedback entry
            Feedback.objects.create(
                feedback=feedback_text,
                date=now(),
                user=user
            )
            messages.success(request, 'Feedback submitted successfully!')
            return redirect('feedback')  # Redirect to avoid re-submission on refresh
        else:
            messages.error(request, 'Feedback cannot be empty!')

    data = Feedback.objects.filter(user=user).order_by('-date') 
    return render(request, 'user/feedback.html', {'data': data})


def reply_feedback(request):
    if 'aname' in request.session:
        if request.method == 'POST':
            fd_id = request.POST.get('fd_id')
            reply = request.POST.get('reply')
            
            Feedback.objects.filter(fd_id=fd_id).update(reply=reply)
            messages.success(request, 'Reply submitted successfully.')
            return redirect('reply_feedback') 
            
        else:
            data = Feedback.objects.all() 
            return render(request, 'master/feedback_view.html', {'data': data})
    else:
        return redirect('user_home')


def news(request):
    if 'aname' in request.session:
        if request.method == 'POST':
            title = request.POST.get('title')
            description = request.POST.get('description')

            if title and description:
                # Create a new news update
                News.objects.create(
                    title=title,
                    description=description
                )
                messages.success(request, 'News added successfully!')
            else:
                messages.error(request, 'Both title and description are required.')

        data = News.objects.all().order_by('-date')
        return render(request, 'master/news.html', {'data': data})
    else:
        return redirect('user_home')

def newslist(request):
    data = News.objects.all()
    return render(request, 'master/newslist.html', {'data': data})

def edit_news(request):
    if 'aname' in request.session:
        news_id=request.GET.get('news_id')
        news_item = get_object_or_404(News, news_id=news_id)

        if request.method == 'POST':
            title = request.POST.get('title')
            description = request.POST.get('description')

            news_item.title = title
            news_item.description = description
            news_item.save()
            messages.success(request, 'News updated successfully!')
            return redirect('news')  
        

        return render(request, 'master/edit_news.html', {'news_item': news_item})
    else:
        return redirect('user_home')


def delete_news(request):
    if 'aname' in request.session:
        news_id = request.GET.get('news_id')
        news_item = get_object_or_404(News, news_id=news_id)
        news_item.delete()

        messages.success(request, 'News deleted successfully!')
        return redirect('news') 
    else:
        return redirect('user_home')
