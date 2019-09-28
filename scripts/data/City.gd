extends Object

class_name City

""" @type: Dictionary """
var districts

"""
Constructor
@method _init
@param districs Dictionary
@return void
"""
func _init(districts):
	self.districts = districts

"""
Returns district
@method get__district
@param dist_key String District name
@return District
"""
func get__district(dist_key: String):
	return self.districts[dist_key]

"""
Returns a dictionary containing average of districts index values
@method get__sums_of_districts_indexes
@return Dictionary
"""
func get__averages_of_districts_indexes():
	var sums = {}
	for dist_key in self.districts:
		var dist_idxs = self.districts[dist_key].get__storage().get__indexes()
		for idx_key in dist_idxs:
			if not sums.has(idx_key):
				sums[idx_key] = {"sum": 0, "count": 0}
			sums[idx_key]["sum"] += dist_idxs[idx_key]
			sums[idx_key]["count"] += 1
	var avgs = {}
	for idx_key in sums:
		avgs[idx_key] = sums[idx_key]["sum"] / sums[idx_key]["count"]
	return avgs
