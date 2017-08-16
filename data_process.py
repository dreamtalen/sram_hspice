def main():
	write1_list, read1_list, write0_list, read0_list = [], [], [], []
	with open("10T_pex_global_5000p.mt0") as f:
		for index, line in enumerate(f.readlines()):
			if index < 4: pass
			else:
				line_list = line.strip().split()
				if len(line_list) == 4:
					write1_list.append(float(line_list[1]))
					read1_list.append(float(line_list[2]))
					write0_list.append(float(line_list[3]))
				else:
					read0_list.append(float(line_list[0]))
	# for write1, read1, write0, read0 in zip(write1_list, read1_list, write0_list, read0_list):
		# print write1, read1, write0, read0
		# print write1*1000000000000
		# print read1*1000000000000
		# print write0*1000000000000
		# print read0*1000000000000
	write1_list = filter(lambda x: x>0, write1_list)
	write0_list = filter(lambda x: x>0, write0_list)
	read1_list = filter(lambda x: x>0, read1_list)
	read0_list = filter(lambda x: x>0, read0_list)
	print len(write1_list), len(read1_list), len(write0_list), len(read0_list)
	# for write, read in zip(write_list, read_list):
	# 	print read*1000000000000
		# print write*1000000000000
	write0_avg = sum(write0_list)/len(write0_list)
	write1_avg = sum(write1_list)/len(write1_list)
	read0_avg = sum(read0_list)/len(read0_list)
	read1_avg = sum(read1_list)/len(read1_list)
	write1_stdev = (sum((i - write1_avg) ** 2 for i in write1_list)/(len(write1_list) - 1)) ** 0.5
	write0_stdev = (sum((i - write0_avg) ** 2 for i in write0_list)/(len(write0_list) - 1)) ** 0.5
	read0_stdev = (sum((i - read0_avg) ** 2 for i in read0_list)/(len(read0_list) - 1)) ** 0.5
	read1_stdev = (sum((i - read1_avg) ** 2 for i in read1_list)/(len(read1_list) - 1)) ** 0.5

	print write0_avg*(10**12), write0_stdev*(10**12), write0_stdev/write0_avg
	print write1_avg*(10**12), write1_stdev*(10**12), write1_stdev/write1_avg
	print read0_avg*(10**12), read0_stdev*(10**12), read0_stdev/read0_avg
	print read1_avg*(10**12), read1_stdev*(10**12), read1_stdev/read1_avg

if __name__ == '__main__':
	main()