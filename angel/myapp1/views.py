from django.shortcuts import render
from .models import*
# Create your views here.
def index(request):
    return render(request,'index.html')
def form(request):
    return render(request,'form.html')
def table(request):
    return render(request,'table.html')

