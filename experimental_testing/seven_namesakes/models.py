from django.db import models
class CultivarGroup(models.Model):
	TSWV_resistance = models.BooleanField(max_length=255, null=False)
	yield_lbs_per_acre = models.FloatField(max_length=255, null=False)
	days_to_mature = models.IntegerField(default=99)
	Desired_Ca = models.FloatField(max_length=255, null=False)
	white_mold_resistance = models.BooleanField(max_length=255, null=False)
	CBR_resistance = models.BooleanField(max_length=255, null=False)
	limb_rot_resistance = models.BooleanField(max_length=255, null=False)
	def __str__(self):
		return "{} - {}".format(self.TSWV_resistance, self.yield_lbs_per_acre, self.days_to_mature, self.Desired_Ca, self.white_mold_resistance, self.CBR_resistance, self.limb_rot_resistance)
class SingleMound(models.Model):
	cultivar_group = models.BooleanField(max_length=255, null=False)
	plot_of_land = models.BooleanField(max_length=255, null=False)
	x_coord_in_plot = models.BooleanField(max_length=255, null=False)
	y_coord_in_plot = models.BooleanField(max_length=255, null=False)
	days_since_h2o_input = models.BooleanField(max_length=255, null=False)
	last_h2o_input_amt = models.BooleanField(max_length=255, null=False)
	days_since_planting = models.BooleanField(max_length=255, null=False)
	soil_moist = models.BooleanField(max_length=255, null=False)
	plant_height = models.BooleanField(max_length=255, null=False)
	leaf_discolor = models.BooleanField(max_length=255, null=False)
	avg_sunlight = models.BooleanField(max_length=255, null=False)
	avg_soil_temp = models.BooleanField(max_length=255, null=False)
	avg_air_temp = models.BooleanField(max_length=255, null=False)
	leaf_discolor_resolved = models.BooleanField(max_length=255, null=False)
	peanut_inoculant_applied = models.BooleanField(max_length=255, null=False)
	last_date_local_observation = models.BooleanField(max_length=255, null=False)
	soil_ph = models.BooleanField(max_length=255, null=False)
	def __str__(self):
		return "{} - {}".format(self.cultivar_group, self.plot_of_land, self.x_coord_in_plot, self.y_coord_in_plot, self.days_since_h2o_input, self.last_h2o_input_amt, self.days_since_planting, self.soil_moist, self.plant_height, self.leaf_discolor, self.avg_sunlight, self.avg_soil_temp, self.avg_air_temp, self.leaf_discolor_resolved, self.peanut_inoculant_applied, self.last_date_local_observation, self.soil_ph)
class PlotOfLand(models.Model):
	(fk) = models.BooleanField(max_length=255, null=False)
	(fk) = models.BooleanField(max_length=255, null=False)
	approx_gps = models.BooleanField(max_length=255, null=False)
	num_rows_full = models.BooleanField(max_length=255, null=False)
	x_dist_between_mounds = models.BooleanField(max_length=255, null=False)
	y_dist_between_mounds = models.BooleanField(max_length=255, null=False)
	diameter_mounds = models.BooleanField(max_length=255, null=False)
	peanuts_seeds_per_mound = models.BooleanField(max_length=255, null=False)
	def __str__(self):
		return "{} - {}".format(self.(fk), self.(fk), self.approx_gps, self.num_rows_full, self.x_dist_between_mounds, self.y_dist_between_mounds, self.diameter_mounds, self.peanuts_seeds_per_mound)
class FarmerId(models.Model):
	farmer_id = models.BooleanField(max_length=255, null=False)
	num_columns_full = models.BooleanField(max_length=255, null=False)
	last_name = models.BooleanField(max_length=255, null=False)
	email = models.BooleanField(max_length=255, null=False)
	phone_number = models.BooleanField(max_length=255, null=False)
	def __str__(self):
		return "{} - {}".format(self.farmer_id, self.num_columns_full, self.last_name, self.email, self.phone_number)
class (fk)(models.Model):
	first_name = models.BooleanField(max_length=255, null=False)
	def __str__(self):
		return "{} - {}".format(self.first_name)
