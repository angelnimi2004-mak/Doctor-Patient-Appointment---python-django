from django.shortcuts import render,HttpResponse

# Create your views here.
def index(request):
    return HttpResponse('index.html'),
def did(request):
    return HttpResponse('angel')
