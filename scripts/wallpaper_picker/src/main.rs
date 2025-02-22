use rand::{random_range, rng, seq::IndexedRandom};
use std::{
    fs,
    io::Write,
    path::PathBuf,
    process::{Command, Stdio},
};

const WALLPAPER_IMAGE_DIR: &str = "/home/chengcheng_0v0/Pictures/Wallpapers";
const TRANSITION_POSITIONS: [&str; 9] = [
    "center",
    "top",
    "left",
    "right",
    "bottom",
    "top-left",
    "top-right",
    "bottom-left",
    "bottom-right",
];

fn read_dir(dir: &str) -> Vec<PathBuf> {
    let mut file_list = Vec::new();

    let read_result = match fs::read_dir(dir) {
        Ok(v) => v,
        Err(e) => panic!("Failed to read directory. Error: {}", e),
    };
    for entry in read_result {
        let entry = entry.unwrap().path();
        if entry.is_file() {
            // println!("-> {:?}", entry);
            file_list.push(entry);
        } else {
            println!("-> Skipped a non-file: {:?}", entry);
        }
    }

    file_list
}

fn main() {
    let mut options = String::new();

    let file_list = read_dir(WALLPAPER_IMAGE_DIR);
    for file in file_list {
        let file_path = file.to_str().unwrap();
        let file_name = file.file_name().unwrap().to_str().unwrap();
        options.push_str(&format!("{file_name}\0icon\x1f{file_path}\n"));
    }
    options = options.trim().into();

    println!(
        "  ==> [ Options ] <==\n{}\n  ==> [ Options End ] <==",
        options
    );

    let output = Command::new("rofi")
        .args(["-config", "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/rofi/config/wallpaper_picker_config.rasi", "-dmenu", "-p", "Choose Wallpaper"])
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .spawn()
        .expect("Failed to start Rofi.");

    let mut stdin = output.stdin.as_ref().unwrap();
    stdin.write_all(options.as_bytes()).unwrap();

    let output = output.wait_with_output().unwrap();
    let choice = String::from_utf8_lossy(&output.stdout).trim().to_string();
    println!("{}", choice);

    Command::new("swww")
        .args([
            "img",
            &format!("{WALLPAPER_IMAGE_DIR}/{choice}"),
            "--transition-type",
            "grow",
            "--transition-pos",
            // TRANSITION_POSITIONS.choose(&mut rng()).unwrap(),
            &format!("{},{}", random_range(0.0..=1.0), random_range(0.0..=1.0)),
            "--transition-duration",
            "1.5",
            "--transition-fps",
            "160",
        ])
        .spawn()
        .expect("Failed to switch wallpaper.");
}
