#!/bin/bash
echo "Running flutter pub get ..."
if ! flutter pub get ; then
  echo "ERROR: Failed to run 'flutter pub get'"
  exit 1
fi

echo "Running flutter pub run build_runner build --delete-conflicting-outputs ..."
if ! flutter pub run build_runner build --delete-conflicting-outputs ; then
  echo "ERROR: Failed to run 'flutter pub run build_runner build --delete-conflicting-outputs'"
  exit 1
fi

echo "Done initializing libraries, generated class & mock files on this project!"