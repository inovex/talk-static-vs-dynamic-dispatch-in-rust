// SPDX-FileCopyrightText: Copyright (c) 2023 inovex GmbH
// SPDX-License-Identifier: MIT

#include <cstdint>
#include <cstdio>

class Shape {
public:
  virtual float area() const = 0;
};

class Rect : public virtual Shape {
public:
  Rect(uint32_t w, uint32_t h) : w_(w), h_(h) {}

  float area() const override { return w_ * h_; }
  // NOTE: The second area function is only needed, because the first is
  // virtual. In that case the compiler would use a virtual function call even
  // in the template method.
  float area2() const { return w_ * h_; }

private:
  uint32_t w_, h_;
};

class Circle : public virtual Shape {
public:
  Circle(uint32_t r) : r_(r) {}

  float area() const override { return 2 * r_ * 3.14f; }
  float area2() const { return 2 * r_ * 3.14f; }

private:
  uint32_t r_;
};

float get_double_area_dynamic(const Shape &shape) {
  return shape.area() * 2.0f;
}

template <typename T> float get_double_area_static(const T &shape) {
  return shape.area2() * 2.0f;
}

int main() {
  auto rect = Rect{1, 2};
  auto circle = Circle{1};

  printf("dynamic rect %4.02f\n", get_double_area_dynamic(rect));
  printf("dynamic circle %4.02f\n", get_double_area_dynamic(circle));
  printf("\n");
  printf("static rect %4.02f\n", get_double_area_static(rect));
  printf("static circle %4.02f\n", get_double_area_static(circle));

  return 0;
}
