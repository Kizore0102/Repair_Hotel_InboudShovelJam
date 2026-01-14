extends Resource
class_name DicFuncUtility

func InicializeNodeDocs(Modo : String, DicionaryDonor : Dictionary, DicionaryResiver : Dictionary, CurrentNode : Node):
	#funciona como esperado
	var Working: bool = false
	match Modo:
		"MatchVar":
			Working = true
			for key in DicionaryDonor.keys():
				if DicionaryResiver.has(key):
					DicionaryResiver[key] =  DicionaryDonor[key]
		"Fill":
			Working = true
			for key in DicionaryDonor.keys():
				var NodeRef = DicionaryDonor[key]
				var NodeObg = CurrentNode.get_node_or_null(NodeRef)
				if NodeObg == null:
					print("Inicialize found a not valid NodeRef")
					print(CurrentNode.name)
				else:
					DicionaryResiver[key] = NodeObg
		null:
			Working = true
			print("Set InicializeNodeDocs to Var or Node")
	if !Working:
		print("there is probably a typo in: ",CurrentNode.name," when seting mode, all modes are Fill and MacthVar")

func TrasfDicItem(DicionaryDonor : Dictionary, Varkey1 : String, DicionaryResiver : Dictionary, Varkey2 : String):
	#apenas a trasferencia direta de dics funciona
	if DicionaryDonor.has(Varkey1) == DicionaryResiver.has(Varkey2):
		DicionaryDonor[Varkey1] = DicionaryResiver[Varkey2]
	else:
		print("NO Valid Tarject Found")

func Pass():
	pass

func PrintDic(Modo : String = "", Dic : Dictionary = {}, Key : Array = []):
	#n funciona, exeto o full
	match Modo:
		"Full":
			print(Dic)
		"One":
			print(Dic.find_key(Key))
		"Mult":
			for key in Key:
				if Dic.has(Key):
					print(Dic[key])
