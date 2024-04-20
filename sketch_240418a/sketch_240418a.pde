Game game;

void setup() {
  size(1000, 550); // Tamaño del lienzo
  game = new Game(); // Inicializa el juego
}

void draw() {
  game.draw(); // Dibuja el juego
}
