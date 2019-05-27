from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from .models import CultivarGroup
from .serializers import CultivarGroupSerializer
class CultivarGroupView(APIView):
	def get(self, request, version, format=None):
		cultivargroup = CultivarGroup.objects.all()
		serializer = CultivarGroupSerializer(cultivargroup, many=True)
		return Response(serializer.data)

from .models import SingleMound
from .serializers import SingleMoundSerializer
class SingleMoundView(APIView):
	def get(self, request, version, format=None):
		singlemound = SingleMound.objects.all()
		serializer = SingleMoundSerializer(singlemound, many=True)
		return Response(serializer.data)

from .models import PlotOfLand
from .serializers import PlotOfLandSerializer
class PlotOfLandView(APIView):
	def get(self, request, version, format=None):
		plotofland = PlotOfLand.objects.all()
		serializer = PlotOfLandSerializer(plotofland, many=True)
		return Response(serializer.data)

from .models import FarmerId
from .serializers import FarmerIdSerializer
class FarmerIdView(APIView):
	def get(self, request, version, format=None):
		farmerid = FarmerId.objects.all()
		serializer = FarmerIdSerializer(farmerid, many=True)
		return Response(serializer.data)
