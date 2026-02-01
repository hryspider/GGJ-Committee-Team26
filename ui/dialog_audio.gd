extends AudioStreamPlayer

func play_3():
	play()
	await finished
	play()
	await finished
	play()
