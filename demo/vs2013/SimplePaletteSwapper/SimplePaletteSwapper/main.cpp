#include <iostream>
#include <SFML/Graphics.hpp>

bool canDrawShader = true;
bool shaderOn = true;

class PaletteSwap
{
	public:
		sf::Vector3f in_colour[4];
		sf::Vector3f out_colour[4];

		PaletteSwap()
		{
			for (int i = 0; i < 4; i++)
			{
				in_colour[i].x = 0.0f;
				in_colour[i].y = 0.0f;
				in_colour[i].z = 0.0f;

				out_colour[i].x = 0.0f;
				out_colour[i].y = 0.0f;
				out_colour[i].z = 0.0f;
			}
		}

		void setInColour(int i, float r, float g, float b)
		{
			in_colour[i].x = r;
			in_colour[i].y = g;
			in_colour[i].z = b;
		}

		void setOutColour(int i, float r, float g, float b)
		{
			out_colour[i].x = r;
			out_colour[i].y = g;
			out_colour[i].z = b;
		}

		void normalizeChannelValues()
		{
			for (int i = 0; i < 4; i++)
			{
				in_colour[i].x /= maxChanValue;
				in_colour[i].y /= maxChanValue;
				in_colour[i].z /= maxChanValue;

				out_colour[i].x /= maxChanValue;
				out_colour[i].y /= maxChanValue;
				out_colour[i].z /= maxChanValue;
			}
		}

	private:
		float maxChanValue = 255.0f;
};

int main()
{
	sf::RenderWindow window(sf::VideoMode(640, 576), "Simple Palette Swapper");

	// init texture
	sf::Texture screenTex;

	if (!screenTex.loadFromFile("images/grayscale screen.png"))
	{
		std::cout << "image load fail" << std::endl;
		return 1;
	}

	screenTex.setSmooth(false);
	screenTex.setRepeated(false);

	// init sprite
	sf::Sprite screenSpr;
	screenSpr.setTexture(screenTex);
	screenSpr.setScale(4.0f, 4.0f);

	// init shader
	sf::Shader gbShader;
	
	if (!sf::Shader::isAvailable())
	{
		std::cout << "No shader for you!" << std::endl;
		canDrawShader = false;
	}
	
	else
	{
		if (!gbShader.loadFromFile("shaders/palette_swap.frag", sf::Shader::Fragment))
		{
			std::cout << "Shader load fail" << std::endl;
			canDrawShader = false;
		}

		else
		{
			PaletteSwap ps;

			// init in colours
			ps.setInColour(0, 0.0f, 0.0f, 0.0f);
			ps.setInColour(1, 128.0f, 128.0f, 128.0f);
			ps.setInColour(2, 192.0f, 192.0f, 192.0f);
			ps.setInColour(3, 255.0f, 255.0f, 255.0f);

			//init out colours
			ps.setOutColour(0, 8.0f, 41.0f, 85.0f);
			ps.setOutColour(1, 34.0f, 111.0f, 95.0f);
			ps.setOutColour(2, 121.0f, 170.0f, 109.0f);
			ps.setOutColour(3, 175.0f, 203.0f, 70.0f);

			ps.normalizeChannelValues();

			gbShader.setUniform("u_in1", ps.in_colour[0]);
			gbShader.setUniform("u_in2", ps.in_colour[1]);
			gbShader.setUniform("u_in3", ps.in_colour[2]);
			gbShader.setUniform("u_in4", ps.in_colour[3]);

			gbShader.setUniform("u_out1", ps.out_colour[0]);
			gbShader.setUniform("u_out2", ps.out_colour[1]);
			gbShader.setUniform("u_out3", ps.out_colour[2]);
			gbShader.setUniform("u_out4", ps.out_colour[3]);

			gbShader.setUniform("u_texture", sf::Shader::CurrentTexture);
		}
	}

	// main loop
	while (window.isOpen())
	{
		sf::Event event;
		while (window.pollEvent(event))
		{
			if (event.type == sf::Event::Closed)
				window.close();

			// toggle shader
			else if (event.type == sf::Event::MouseButtonPressed && event.mouseButton.button == sf::Mouse::Button::Left)
			{
				shaderOn = !shaderOn;
			}
		}

		//draw stuff
		window.clear();

		if (canDrawShader && shaderOn)
			window.draw(screenSpr, &gbShader);
		else
			window.draw(screenSpr);

		window.display();
	}

	return 0;
}