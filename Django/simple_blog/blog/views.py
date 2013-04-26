# Create your views here.

from blog.models import Blog
from django.shortcuts import render_to_response

def index(request):
 entries = Blog.objects.all()
 return render_to_response('index.html' , locals())
