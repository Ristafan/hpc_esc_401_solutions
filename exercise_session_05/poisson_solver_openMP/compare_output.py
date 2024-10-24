
def compare_files(file1, file2):
    with open(file1, 'r') as f1, open(file2, 'r') as f2:
        for line1, line2 in zip(f1, f2):
            if line1 != line2:
                return False
        # Check if both files have the same number of lines
        if f1.readline() or f2.readline():
            return False
    return True

# Example usage:
file1 = 'jacobi_1.txt'
file2 = 'jacobi_4.txt'
result = compare_files(file1, file2)
print(result)

