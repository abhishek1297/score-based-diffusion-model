# Score-based Diffusion Modeling

This notebook implements a basic Denoising Diffusion Probabilistic Model (DDPM) to generate samples from a 2D data distribution (either bimodal Gaussian or two moons). It defines the forward diffusion process (adding noise) and trains a neural network to learn the reverse process (removing noise) using either a noise prediction or score matching objective.
