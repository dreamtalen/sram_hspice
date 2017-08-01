def main():
	write_list, read_list= [], []
	with open("deck_rw0.mt0") as f:
		for index, line in enumerate(f.readlines()):
			if index < 4: pass
			else:
				line_list = line.strip().split()
				if len(line_list) == 4:
					write_list.append(float(line_list[1]))
					read_list.append(float(line_list[2]))
				else: pass
	write_list = filter(lambda x: x>0, write_list)
	read_list = filter(lambda x: x>0, read_list)
	# for write, read in zip(write_list, read_list):
	# 	print read*1000000000000
		# print write*1000000000000
	write_avg = sum(write_list)/len(write_list)
	read_avg = sum(read_list)/len(read_list)
	write_stdev = (sum((i - write_avg) ** 2 for i in write_list)/(len(write_list) - 1)) ** 0.5
	read_stdev = (sum((i - read_avg) ** 2 for i in read_list)/(len(read_list) - 1)) ** 0.5

	print write_avg*(10**12), write_stdev*(10**12)
	print read_avg*(10**12), read_stdev*(10**12)

if __name__ == '__main__':
	main()