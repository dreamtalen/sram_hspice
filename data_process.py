def main():
	write1_list, read1_list, write0_list, read0_list = [], [], [], []
	with open("10t_bitcell_mac_1000p.mt0") as f:
		for line in f.readlines():
			line_list = line.strip().split()
			if len(line_list) == 4:
				write1_list.append(float(line_list[1]))
				read1_list.append(float(line_list[2]))
				write0_list.append(float(line_list[3]))
			else:
				read0_list.append(float(line_list[0]))
	for write1, read1, write0, read0 in zip(write1_list, read1_list, write0_list, read0_list):
		# print write1, read1, write0, read0
		# print write1*1000000000000
		# print read1*1000000000000
		# print write0*1000000000000
		print read0*1000000000000


if __name__ == '__main__':
	main()