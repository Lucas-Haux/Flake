{ pkgs, ... }:
let
  btopWithRocm = pkgs.btop.override {
    rocmSupport = true;
  };
in
{
  programs.btop = {
    enable = true;
    package = btopWithRocm;
    settings = {
      color_theme = "nord";
      theme_background = false;

      presets = "proc:0:default net:0:default";
      shown_boxes = "cpu mem";
      vim_keys = true;
      background_update = true;

      # cpu
      custom_cpu_name = "AMD 7800X3D";
      cpu_graph_upper = "total";
      cpu_single_graph = true;
      show_uptime = false;
      cpu_sensor = "Auto";
      check_temp = true;
      show_coretemp = false;
      show_gpu_info = "Auto"; # should only show my integrated graphics
      custom_gpu_name1 = "Integrated Graphics";

      # gpu
      custom_gpu_name0 = "AMD RX 6800";
      nvml_measure_pcie_speeds = false;
      rsmi_measure_pcie_speeds = true;

      # mem
      mem_graphs = true;
      show_disks = false;
      disks_filter = "/";
    };
  };

  home.packages = [
    pkgs.rocmPackages.rocm-smi
  ];
}
