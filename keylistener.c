#include <stdio.h>
#include <stdlib.h>
#include <ApplicationServices/ApplicationServices.h>

#define USER "zoft"

static char cmd[] = "sudo -u '" USER "' sketchybar --trigger update-bongo-cat-image";

CGEventRef onCGEvent(CGEventTapProxy proxy,
                     CGEventType type,
                     CGEventRef event,
                     void *refcon);

int main(void) {
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
