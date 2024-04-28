#include <stdio.h>
#include <opencv2/opencv.hpp>
#include "Settings.h"
#include "Complex.hpp"
#include <cmath>

using namespace cv;
using namespace std;

void AskSettings(Settings* settings)
{
	cout << "Enter image height: ";
	cin >> settings->image_height;

	cout << "Enter image width: ";
	cin >> settings->image_width;

	cout << "Enter max iterations: ";
	cin >> settings->max_iterations;

	cout << "Settings are: " << settings->image_height << "x" << settings->image_width << " - Max iterations: " << settings->max_iterations << endl;
}

int main()
{
	// Settings
	auto settings = Settings();
	AskSettings(&settings);

	// Create the image
	Mat image = Mat(static_cast<int>(settings.image_height), static_cast<int>(settings.image_width), CV_8UC3, Scalar(0, 0, 0));

	// Mandelbrot
	size_t y0;
	size_t x0;
	for (size_t y = 0; y < settings.image_height; y++)
	{
		for (size_t x = 0; x < settings.image_width; x++)
		{
			// Save indices
			y0 = y;
			x0 = x;
			lerp
				double X = static_cast<double>(x0);
			double Y = static_cast<double>(y0);
			size_t iteration = 0;

			while (x * x + y * y <= 4 && iteration < settings.max_iterations)
			{
				auto xtemp = x * x - y * y + x0;
				y = 2 * x * y + y0;

				x = xtemp;

				iteration += 1;
			}

			if (iteration != settings.max_iterations)
			{
				Vec3b& color = image.at<Vec3b>(y0, x0);
				color[0] = 255;
			}

			// Put them back
			x = x0;
			y = y0;
		}
	}

	// Save the mandelbrot image
	imwrite("mandelbrot.png", image);

	return 0;
}