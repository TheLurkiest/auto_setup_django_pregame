# Guide on Django Basics

### Note: everything you see here (and in every other word document we have included) is done automatically by our single shell script— all you need to do is enter this terminal command ./venv_autosetup_simpler.sh-- and from there, everything that follows will be guided by the terminal, which will display specific instructions after the completion of each step after this initial shell script is executed (all of which should take less than 30 seconds to complete)-- so you don’t really need to read any of this-- but there’s still some useful information here on how to edit and manipulate and make use of the code once it’s been created (and occasionally just random info/notes I don't know where else to put, for instance-- this terminal command allows you to test your API out once you’ve got it all set up: python manage.py test).

---

## The 7 Django .py files: UNDERSTANDING HOW THE PYTHON CODE IN THESE 7 GENERIC PYTHON FILES (WHICH YOU WILL SEE IN ESSENTIALLY ANY DJANGO REST API YOU MESS WITH) ACTUALLY INTER-RELATE AND INTER-CONNECT WITH ONE ANOTHER

#### this is the simplest example you’ll find of what to expect within these 7 files— again: all these steps are taken care of automatically by our shell script—this is just for reference for those who may be interested.  These 7 files are the ones that you would normally have to take care of manually by hand—they aren’t generated automatically, normally.  Obviously though, our shell script will take care of all of this for you


6 python files within api/: 

    1) admin.py:

from django.contrib import admin
from .models import User

admin.site.register(User)

    2) models.py:

from django.db import models

class User(models.Model):
    first_name = models.CharField(max_length=255, null=False)
    last_name = models.CharField(max_length=255, null=False)
    email = models.CharField(max_length=255, null=False)
    username = models.CharField(max_length=255, null=False)
    password = models.CharField(max_length=255, null=False)

    def __str__(self):
        return "{} - {}".format(self.first_name, self.last_name, self.email,
        self.username, self.password)


    3) serializers.py:

from rest_framework import serializers
from .models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("first_name", "last_name", "email", "username", "password")

    4) tests.py:

import unittest
from django.test import TestCase
from django.test import Client

from django.urls import reverse
from rest_framework.test import APITestCase, APIClient
from rest_framework.views import status

from .models import User
from .serializers import UserSerializer

#first_name
#last_name
#email
#username
#password

class BaseViewTest(APITestCase):
    client = APIClient()

    @staticmethod
    def create_user(first_name="", last_name="", email="", username="", password=""):
        if first_name != "" and last_name != "" and email != "" and username != "" and password != "":
            User.objects.create(first_name=first_name, last_name=last_name, email=email, username=username, password=password)

    def setUp(self):
        # add test data
        self.create_user("Billy", "Blackenthrope", "something777@mail.com", "pixel_lad69", "eato_guess!!!")
        self.create_user("Jill", "Blacklorne", "something1@mail.com", "pixel_lad_abc999", "easo_guess!!!")
        self.create_user("Willy", "Blackman", "something23@mail.com", "pixel_lad779", "easy_to_gu!!!")
        self.create_user("Timmy", "Blackenthropenstork", "something@mail.com", "pixel_lady420", "easy!!!")

class GetAllUsersTest(BaseViewTest):

    def test_get_all_users(self):
        response = self.client.get(
            reverse("user-all", kwargs={'version': 'v1'})
        )

        expected = User.objects.all()
        serialized = UserSerializer(expected, many=True)
        self.assertEqual(response.data, serialized.data)

        self.assertEqual(response.status_code, status.HTTP_200_OK)


    def test_get_all_usersb2(self):
        response = self.client.get(
            reverse("user-all", kwargs={'version': 'v1'})
        )

        expected = User.objects.all()
        serialized = UserSerializer(expected, many=True)
        self.assertEqual(response.data, serialized.data)

        self.assertEqual(response.status_code, status.HTTP_200_OK)

    5) urls.py:

from django.urls import path
from .views import UserView


urlpatterns = [
    path('user/', UserView.as_view(), name="user-all"),
]

    6) views.py:

from .models import User
from .serializers import UserSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

class UserView(APIView):
    """
    This class handles GET and POST actions for the Song resource.
    GET - Retrieves a list of all users
    POST - Creates a new song
    """
    def get(self, request, version, format=None):
        user = User.objects.all()
        serializer = UserSerializer(user, many=True)
        return Response(serializer.data)



...plus 1 more in config/urls.py makes 7 files we care about in total.

    7) config/urls.py:

"""config URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
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
from django.urls import path, include, re_path

urlpatterns = [
    path('admin/', admin.site.urls),
    re_path('api/(?P<version>(v1|v2))', include('reflections.urls'))
]



--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------



# X NOTE 1:


Understanding the fundamental structure and interconnection of the core Django files is crucial for grasping how Django applications work, especially in the context of Django REST Framework (DRF) projects. Let's break down the role of each of these seven files you've mentioned and how they interconnect within a typical Django REST API setup. This should help clarify their purposes and interactions.
1. models.py (in api/)

This file defines the data models of your Django app. Each class in models.py represents a table in your database, with class attributes mapping to database fields. Django uses these definitions to create the database schema.
2. admin.py (in api/)

The admin.py file is used to register your models with Django's built-in admin interface. This makes it possible to manage your data through a web interface, useful for testing and debugging during development.
3. serializers.py (in api/)

Serializers allow complex data such as queryset and model instances to be converted to native Python datatypes that can then be easily rendered into JSON, XML, or other content types. Serializers also provide deserialization, allowing parsed data to be converted back into complex types, after first validating the incoming data.
4. views.py (in api/)

Views are where the logic of your application is defined. Each view receives HTTP requests and returns HTTP responses. Views access the data needed to satisfy requests via models and delegate formatting to the serializers.
5. urls.py (in api/)

This file is responsible for routing incoming HTTP requests to the appropriate view based on the request URL. It works closely with views.py to ensure that each URL pattern is matched with its corresponding view function or class.
6. tests.py (in api/)

Tests in Django are defined in the tests.py file. This file contains test classes and functions that Django's test framework can execute to test various parts of your application, such as models, views, and even the entire application flow.
7. urls.py (in config/)

The project-level urls.py file (typically found in the config/ directory or whatever you name your project directory) includes application URL patterns from your apps into the main project. It acts as a central hub for URL configurations and often includes the URL patterns from the api/urls.py file using Django's include function.
How They Interconnect:

    Models are the basis for both Admin configurations and Serializers. They define the data structure that admin interfaces manipulate and serializers convert to/from JSON.
    Views interact directly with models through queries and use serializers to format querysets or model instances for HTTP responses. Views implement the logic to process incoming data (using serializers for validation) and to interact with models.
    URLs in both the app (api/urls.py) and project (config/urls.py) levels define how HTTP requests are routed to the appropriate views.

Visualization and Understanding:

Seeing the end product of these files after being generated and understanding their interaction would certainly provide a deeper insight into the Django REST Framework setup. If you have the structure ready or can share an example of the end product, it would indeed help visualize how these components come together in a working project.

Your initiative to break down these components and explore their connections is a solid approach to mastering Django's architecture and the REST framework. Each of these files serves a specific purpose, and understanding their roles individually and collectively will significantly enhance your ability to design and implement robust Django applications.


--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------



# X NOTE 2:

GPT

Your thoughts on identifying the core files in a Django REST Framework (DRF) project are well-founded and provide a solid foundation for understanding Django's architecture. The seven files you've highlighted indeed form the backbone of most Django projects, especially those utilizing the Django REST Framework for building APIs. However, depending on the project's scope and requirements, a few additional components and files might enhance your understanding of Django's flexibility and the breadth of its ecosystem.
Additional Components to Consider

    settings.py (in config/):
        Purpose: This file contains all the configuration for your Django project. This includes database configurations, installed apps, middleware, templates, and more. Understanding how settings.py works is crucial for configuring Django to work with different environments (development, testing, production), databases, and integrating third-party apps.

    urls.py (Application Level vs. Project Level):
        Clarification: While you've mentioned urls.py twice, it's worth distinguishing between the application level and project level. The project level urls.py (in config/) is the entry point for all URL routes, including those of installed apps. Each app can also have its own urls.py for app-specific routes, illustrating Django's modular design.

    middleware.py:
        Purpose: Middleware are hooks into Django's request/response processing. They're a framework of hooks into Django's request/response processing. It's a light, low-level plugin system for globally altering Django’s input or output. Each middleware component can process a request when it comes in, process a response as it goes out, or both. Understanding middleware can be critical for tasks such as session management, user authentication, cross-site request forgery protection, and more.

    forms.py (Optional, in api/ or any app):
        Purpose: If your application involves any form processing, forms.py is used to define forms based on your models. While not always necessary (especially in API-focused applications where you might not have traditional forms), it's a core part of Django's handling of web forms.

    asgi.py and wsgi.py (in config/):
        Purpose: These files allow your Django project to communicate with the web server. wsgi.py is used for traditional synchronous servers, whereas asgi.py is used for asynchronous servers. Understanding these files is essential for deploying Django applications.

Universal Application

To translate this knowledge into something more universally applicable across Django projects, consider focusing on:

    Project Structure and Modular Design: Emphasize how Django encourages the separation of concerns through its modular app design. Each app within a project can be reusable in other projects.
    Configuration and Environment Management: Highlight the importance of settings.py for adapting your project to different environments or requirements.
    Request and Response Flow: Discuss how Django processes requests and returns responses, including middleware's role in this process.
    Deployment Essentials: Understanding wsgi.py and asgi.py is crucial for deploying Django applications to production environments.

By expanding your focus to include these aspects, you can provide a more rounded view of Django that applies to a wide range of projects, not just those structured exactly like yours. This broader perspective can make your insights and the knowledge you're sharing even more valuable to those learning Django or looking to deepen their understanding of its architecture.
