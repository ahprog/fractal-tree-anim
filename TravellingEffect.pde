/**
 * Pour l'effet de zoom / suivi d'une branche
 */
static class TravellingEffect {
  static float zoom = 1;
  static Branch focusBranch;
  static PVector getFocusPoint() {
    return new PVector(
      focusBranch.worldPosition.x + focusBranch.size * cos(radians(focusBranch.worldRotation + 270)),
      focusBranch.worldPosition.y + focusBranch.size * sin(radians(focusBranch.worldRotation + 270))
    );
  }
}
