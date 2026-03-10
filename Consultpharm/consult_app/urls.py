"""
URL configuration for cleaning_management project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from .import views

urlpatterns = [
    path('',views.index,name="index"),
    path('index/',views.index,name="index"),
    path('about/',views.about,name="about"),
    path("user_login/",views.user_login,name="user_login"),
    path("user_registration/",views.user_registration,name="user_registration"),
    path("login_action/",views.login_action,name="login_action"),
    path("user_action/",views.user_action,name="user_action"),

    # Admin
    path('admin_home/', views.admin_home, name='admin_home'),
    path('doctor_reg/', views.doctor_reg, name='doctor_reg'),
    path('view_order/', views.view_order, name='view_order'),
    path('c_order/', views.c_order, name='c_order'),
    path('admin_logout/', views.admin_logout, name='admin_logout'),
    path("doctor_action/",views.doctor_action,name="doctor_action"),
    path("dr_list/",views.dr_list,name="dr_list"),
    path("delete_dr/",views.delete_dr,name="delete_dr"),
    path('reply_feedback/', views.reply_feedback, name='reply_feedback'),
    path('news/', views.news, name='news'),
    path('edit_news/', views.edit_news, name='edit_news'),
    path('newslist/', views.newslist, name='newslist'),
    path('delete_news/', views.delete_news, name='delete_news'),
    

    

  
   
    # #  
    path('doctor_home/',views.doctor_home,name="doctor_home"),
    path('dr_profile/',views.dr_profile,name="dr_profile"),
    path('view_problem/',views.view_problem,name="view_problem"),
    path('reply/',views.reply,name="reply"),
    path('completed_problem/',views.completed_problem,name="completed_problem"),
   



    # #
    # path('user_logout',views.user_logout,name="user_logout"),
    path('user_home/',views.user_home,name="user_home"),
    path('view_dr/',views.view_dr,name="view_dr"),
    path('consult_history/',views.consult_history,name="consult_history"),
    path('consult_withdr/',views.consult_withdr,name="consult_withdr"),
    path('purchase_history/',views.purchase_history,name="purchase_history"),
    path('buy_medicines/',views.buy_medicines,name="buy_medicines"),
    path('user_logout/',views.user_logout,name="user_logout"),
    path("feedback/",views.feedback,name="feedback"),


  

   

    

]
