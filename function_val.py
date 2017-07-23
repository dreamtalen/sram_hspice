def main():
	write1_list, read1_list, write0_list, read0_list = [], [], [], []
	with open("10t_bitcell_mac_10000p_tt_m.mt0.bak") as f:
		for line in f.readlines():
			line_list = line.strip().split()
			if len(line_list) == 4:
				write1_list.append(float(line_list[1]))
				read1_list.append(float(line_list[2]))
				write0_list.append(float(line_list[3]))
			else:
				read0_list.append(float(line_list[0]))
	fault_count = 0
	min_write1, min_read1, max_write0, max_read0 = 0.35, 0.35, 0, 0
	for write1, read1, write0, read0 in zip(write1_list, read1_list, write0_list, read0_list):
		# print write1, read1, write0, read0
		min_write1 = min(min_write1, write1)
		min_read1 = min(min_read1, read1)
		max_write0 = max(max_write0, write0)
		max_read0 = max(max_read0, read0)

		if write1 < 0.34 or read1 < 0.34 or write0 > 0.01 or read0 > 0.01:
			fault_count += 1
			print fault_count
			print write1, read1, write0, read0
		# print min_write1, min_read1, max_write0, max_read0
		# print write1*1000000000000
		# print read1*1000000000000
		# print write0*100000000000010t_bitcell_mac_10000p_tt_m.mt0
		# print read0*1000000000000
	print min_write1, min_read1, max_write0, max_read0

if __name__ == '__main__':
	main()