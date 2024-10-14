# credit: https://www.youtube.com/watch?v=N9KxpPyJMJA

function virmon
  set --local virmon1 'virmon1'
  set --local virmon2 'virmon2'
  set --local virmon3 'virmon3'
  set --local primary_monitor $(xrandr --query | grep " connected" | cut -d" " -f1)

  if test $(xrandr --listactivemonitors | grep -c $virmon1) -eq 0
  or test $(xrandr --listactivemonitors | grep -c $virmon2) -eq 0
  or test $(xrandr --listactivemonitors | grep -c $virmon3) -eq 0
    # split half equally
    # xrandr --setmonitor $virmon1 1920/349x2160/393+0+0 $primary_monitor
    # xrandr --setmonitor $virmon2 1920/349x2160/393+1920+0 none

    # split to third, streaming setup
    xrandr --setmonitor $virmon1 1920/349x2160/196+0+0 $primary_monitor
    xrandr --setmonitor $virmon2 1920/349x1080/393+1920+0 none
    xrandr --setmonitor $virmon3 1920/349x1080/393+1920+1080 none

    # refresh
    xrandr --fb 3840x2160
  else
    for mon in $virmon1 $virmon2 $virmon3
      if test $(xrandr --listactivemonitors | grep -c $mon) -eq 1
        xrandr --delmonitor $mon
      end
    end
  end
end
