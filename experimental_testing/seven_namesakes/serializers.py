from rest_framework import serializers

from .models import CultivarGroup
class CultivarGroupSerializer(serializers.ModelSerializer):
	class Meta:
		model = CultivarGroup
		fields = ("TSWV_resistance", "yield_lbs_per_acre", "days_to_mature", "Desired_Ca", "white_mold_resistance", "CBR_resistance", "limb_rot_resistance")

from .models import SingleMound
class SingleMoundSerializer(serializers.ModelSerializer):
	class Meta:
		model = SingleMound
		fields = ("cultivar_group", "plot_of_land", "x_coord_in_plot", "y_coord_in_plot", "days_since_h2o_input", "last_h2o_input_amt", "days_since_planting", "soil_moist", "plant_height", "leaf_discolor", "avg_sunlight", "avg_soil_temp", "avg_air_temp", "leaf_discolor_resolved", "peanut_inoculant_applied", "last_date_local_observation", "soil_ph")

from .models import PlotOfLand
class PlotOfLandSerializer(serializers.ModelSerializer):
	class Meta:
		model = PlotOfLand
		fields = ("(fk)", "(fk)", "approx_gps", "num_rows_full", "x_dist_between_mounds", "y_dist_between_mounds", "diameter_mounds", "peanuts_seeds_per_mound")

from .models import FarmerId
class FarmerIdSerializer(serializers.ModelSerializer):
	class Meta:
		model = FarmerId
		fields = ("farmer_id", "num_columns_full", "last_name", "email", "phone_number")

from .models import (fk)
class (fk)Serializer(serializers.ModelSerializer):
	class Meta:
		model = (fk)
		fields = ("first_name")
