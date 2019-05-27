from django.urls import path
from .views import CultivarGroupView
urlpatterns = [
	path('cultivargroup/', CultivarGroupView.as_view(), name="cultivargroup-all"),
]

from .views import SingleMoundView
urlpatterns = [
	path('singlemound/', SingleMoundView.as_view(), name="singlemound-all"),
]

from .views import PlotOfLandView
urlpatterns = [
	path('plotofland/', PlotOfLandView.as_view(), name="plotofland-all"),
]

from .views import FarmerIdView
urlpatterns = [
	path('farmerid/', FarmerIdView.as_view(), name="farmerid-all"),
]

from .views import (fk)View
urlpatterns = [
	path('(fk)/', (fk)View.as_view(), name="(fk)-all"),
]

