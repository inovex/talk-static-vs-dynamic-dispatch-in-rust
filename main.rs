// SPDX-FileCopyrightText: Copyright (c) 2023 inovex GmbH
// SPDX-License-Identifier: MIT

struct Rect  {
    width : u32,
    height : u32,
}

struct Circle {
    radius : u32,
}

trait Shape {
    fn area(&self) -> f32;
}

impl Shape for Rect {
    fn area(&self) -> f32 {
        (self.width * self.height) as f32
    }
}

impl Shape for Circle {
    fn area(&self) -> f32 {
        self.radius as f32 * self.radius as f32 * 3.14
    }
}

// https://doc.rust-lang.org/reference/types/trait-object.html
fn get_double_area_dynamic(shape: &dyn Shape) -> f32 {
    shape.area() * 2.0
}

// https://doc.rust-lang.org/reference/types/impl-trait.html
fn get_double_area_static(shape: &impl Shape) -> f32 {
    shape.area() * 2.0
}

fn main() {
    let rect = Rect { width : 1, height: 2 };
    let circle = Circle { radius: 1 };

    println!("dynamic rect {}", get_double_area_dynamic(&rect));
    println!("dynamic circle {}", get_double_area_dynamic(&circle));
    println!();
    println!("static rect {}", get_double_area_static(&rect));
    println!("static circle {}", get_double_area_static(&circle));
}
