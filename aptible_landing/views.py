from django.shortcuts import render
# Create your views here.


def base(request):
    return render(request, 'aptible_landing/base.html')
