#include <stdio.h>
#include <stdlib.h>
#include <ApplicationServices/ApplicationServices.h>

static char cmd[1000];

CGEventRef onCGEvent(CGEventTapProxy proxy,
                     CGEventType type,
                     CGEventRef event,
                     void *refcon);

int main(void) {
  const char* user = getenv("USER");
  sprintf(cmd, "sudo -u %s sketchybar --trigger update-bongo-cat-image", user);

  CFMachPortRef eventTap = CGEventTapCreate(kCGSessionEventTap,
                                            kCGHeadInsertEventTap,
                                            0,
                                            ((1 << kCGEventKeyDown) | (1 << kCGEventKeyUp)),
                                            onCGEvent,
                                            NULL);

  if (!eventTap) {
    fprintf(stderr, "[ERROR]: Can't create event handler. Try to run with sudo.\n");
    return 1;
  }

  CFRunLoopAddSource(CFRunLoopGetCurrent(),
                     CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0),
                     kCFRunLoopCommonModes);
  CGEventTapEnable(eventTap, true);
  CFRunLoopRun();
}

CGEventRef onCGEvent(CGEventTapProxy proxy,
                     CGEventType type,
                     CGEventRef event,
                     void *refcon) {
  if (type != kCGEventKeyDown) return event;

  system(cmd);

  return event;
}
