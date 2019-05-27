from django.contrib import admin
from .models import CultivarGroup, SingleMound, PlotOfLand, FarmerId, (fk)
admin.site.register(CultivarGroup)
admin.site.register(SingleMound)
admin.site.register(PlotOfLand)
admin.site.register(FarmerId)
admin.site.register((fk))
