import numpy as ny

def H_from_points(fp,tp):
	if fp.shape != tp.shape:
		raise RuntimeError, 'number of points do not match'

	nbr_correspondences = fp.shape[1]
	A = ny.zeros((2*nbr_correspondences))

	for i in range(nbr_correspondences):
		A[2*i] = [-fp[0][i], -fp[1][i], -1, 0,0,0,
				  tp[0][i]*fp[0][i], tp[0][i]*fp[1][i], tp[0][i]]
		A[2*i] = [0,0,0,-fp[0][i], -fp[1][i], -1
				  tp[1][i]*fp[0][i], tp[1][i]*fp[1][i], tp[1][i]]

	U,S,V = ny.linalg.svd(A)
	H = V[8].reshape((3,3))
	return H