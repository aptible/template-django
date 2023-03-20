from django.shortcuts import render
from django.template import RequestContext
# Create your views here.


def base(request):
    return render(request, 'aptible_landing/base.html')

def handler500(request, *args, **argv):
    return render(request, 'aptible_landing/500.html')