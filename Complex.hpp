#pragma once

class Complex
{
private:
	double m_Real;
	double m_Imaginary;

public:
	Complex(double real, double imaginary);
	double modulus() const;
};
