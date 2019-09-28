extends Node2D

# Юридическое лицо и ИП
enum OrganizationType {LEGAL, INDIVIDUAL}
const TAXCONFIG_PATH = "res://config/TaxConfig.cfg"
const STRATCONFIG_PATH = "res://config/TaxStrat.cfg"
const SCHEMACONFIG_PATH = "res://config/Schemas.cfg"
var taxes = Array()
var strats = Array()
# Key: [OrganizationType.NAME, Strat_name]
var shemas = {}

class Schema:
	var org_type
	var strat
	var taxes
	var complexity

	func _init(org, strt, txs):
		org_type = org
		strat = strt
		taxes = txs
		complexity = len(txs)

func _init():
	var config = ConfigFile.new()
	var err = config.load(SCHEMACONFIG_PATH)
	
	var org_t
	var strt
	var txs
	
	if err == OK:
		var tax_schemas = config.get_sections()
		for tax_schema in tax_schemas:
			org_t = config.get_value(tax_schema, "org_type")
			strt = config.get_value(tax_schema, "strat")
			txs = config.get_value(tax_schema, "taxes")
			if not strats.has(strt):
				strats.append(strt)
			for tx in txs:
				if not taxes.has(tx):
					taxes.append(tx)
			shemas[[OrganizationType.get(org_t), strt]] = Schema.new(org_t, strt, txs)
