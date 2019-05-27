from django.db import models
class CultivarGroup(models.Model):
	tswv_resistance = models.BooleanField()
	yield_lbs_per_acre = models.FloatField(default=0.5)
	days_to_mature = models.IntegerField(default=99)
	desired_ca = models.FloatField(default=0.5)
	white_mold_resistance = models.BooleanField()
	cbr_resistance = models.BooleanField()
	limb_rot_resistance = models.BooleanField()
	def __str__(self):
		return "{} - {}".format(TSWV_resistance)
	uuid = models.UUIDField(default=uuid.uuid4, editable=False)
class SingleMound(models.Model):
	cultivar_group = models.ForeignKey("Cultivar_group") on_delete=models.CASCADE
	plot_of_land = models.ForeignKey("Plot_of_land") on_delete=models.CASCADE
	x_coord_in_plot = models.IntegerField(default=99)
	y_coord_in_plot = models.IntegerField(default=99)
	days_since_h2o_input = models.IntegerField(default=99)
	last_h2o_input_amt = models.FloatField(default=0.5)
	days_since_planting = models.IntegerField(default=99)
	soil_moist = models.FloatField(default=0.5)
	plant_height = models.FloatField(default=0.5)
	leaf_discolor = models.CharFieldField(max_length=255, null=False)
	avg_sunlight = models.FloatField(default=0.5)
	avg_soil_temp = models.FloatField(default=0.5)
	avg_air_temp = models.FloatField(default=0.5)
	leaf_discolor_resolved = models.BooleanField()
	peanut_inoculant_applied = models.BooleanField()
	last_date_local_observation = models.Field()
	soil_ph = models.Field()
class PlotOfLand(models.Model):
	farmer_id = models.ForeignKey("Farmer_id") on_delete=models.CASCADE
	num_columns_full = models.IntegerField(default=99)
	approx_gps = models.CharFieldField(max_length=255, null=False)
	num_rows_full = models.IntegerField(default=99)
	x_dist_between_mounds = models.FloatField(default=0.5)
	y_dist_between_mounds = models.FloatField(default=0.5)
	diameter_mounds = models.FloatField(default=0.5)
	peanuts_seeds_per_mound = models.IntegerField(default=99)
class FarmerId(models.Model):
	user_id = models.CharFieldField(max_length=255, null=False)
	first_name = models.CharFieldField(max_length=255, null=False)
	last_name = models.CharFieldField(max_length=255, null=False)
	email = models.CharFieldField(max_length=255, null=False)
	phone_number = models.CharFieldField(max_length=255, null=False)
	def __str__(self):
		return "{} - {}".format(self.user_id)
	uuid = models.UUIDField(default=uuid.uuid4, editable=False)
