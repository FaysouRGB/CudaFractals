#include "Complex.hpp"
#include <cmath>

Complex::Complex(const double real, const double imaginary)
{
	m_Real = real;
	m_Imaginary = imaginary;
}

double Complex::modulus() const
{
	return sqrt(pow(this->m_Real, 2.0) + pow(this->m_Imaginary, 2.0));
}
