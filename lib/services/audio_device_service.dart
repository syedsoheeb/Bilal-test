import 'package:flutter/material.dart';
import '../models/models.dart';
import 'settings_service.dart';

class AudioDeviceService extends ChangeNotifier {
  final SettingsService _settingsService;
  
  List<AudioDevice> _devices = [];
  AudioDevice? _selectedDevice;
  List<SpeakerGroup> _speakerGroups = [];
  
  AudioDeviceService(this._settingsService);
  
  // Getters
  List<AudioDevice> get devices => _devices;
  AudioDevice? get selectedDevice => _selectedDevice;
  List<SpeakerGroup> get speakerGroups => _speakerGroups;
  
  Future<void> initialize() async {
    // In a real app, this would discover and connect to audio devices
    // For now, we'll add some sample devices
    _devices = [
      AudioDevice(
        id: 'device1',
        name: 'Living Room Speaker',
        type: 'google_cast',
        isConnected: false,
      ),
      AudioDevice(
        id: 'device2',
        name: 'Kitchen Speaker',
        type: 'google_cast',
        isConnected: false,
      ),
      AudioDevice(
        id: 'device3',
        name: 'Bedroom Echo',
        type: 'alexa',
        isConnected: false,
      ),
    ];
    
    _speakerGroups = [
      SpeakerGroup(
        id: 'group1',
        name: 'Downstairs Speakers',
        deviceIds: ['device1', 'device2'],
      ),
    ];
    
    notifyListeners();
  }
  
  // Select a device
  Future<void> selectDevice(String deviceId) async {
    final device = _devices.firstWhere(
      (d) => d.id == deviceId,
      orElse: () => throw Exception('Device not found'),
    );
    
    // Connect to the device
    await connectToDevice(device);
    
    _selectedDevice = device;
    notifyListeners();
  }
  
  // Connect to a device
  Future<bool> connectToDevice(AudioDevice device) async {
    // In a real app, this would connect to the actual device
    // For now, we'll simulate connection
    final index = _devices.indexWhere((d) => d.id == device.id);
    if (index != -1) {
      final updatedDevices = List<AudioDevice>.from(_devices);
      updatedDevices[index] = AudioDevice(
        id: device.id,
        name: device.name,
        type: device.type,
        isConnected: true,
      );
      _devices = updatedDevices;
      notifyListeners();
      return true;
    }
    return false;
  }
  
  // Disconnect from a device
  Future<bool> disconnectFromDevice(AudioDevice device) async {
    // In a real app, this would disconnect from the actual device
    // For now, we'll simulate disconnection
    final index = _devices.indexWhere((d) => d.id == device.id);
    if (index != -1) {
      final updatedDevices = List<AudioDevice>.from(_devices);
      updatedDevices[index] = AudioDevice(
        id: device.id,
        name: device.name,
        type: device.type,
        isConnected: false,
      );
      _devices = updatedDevices;
      
      if (_selectedDevice?.id == device.id) {
        _selectedDevice = null;
      }
      
      notifyListeners();
      return true;
    }
    return false;
  }
  
  // Play audio on a device
  Future<bool> playAudio(String audioUrl, {String? deviceId}) async {
    // In a real app, this would send the audio to the actual device
    // For now, we'll just simulate success
    return true;
  }
  
  // Stop audio on a device
  Future<bool> stopAudio({String? deviceId}) async {
    // In a real app, this would stop the audio on the actual device
    // For now, we'll just simulate success
    return true;
  }
  
  // Create a speaker group
  Future<bool> createSpeakerGroup(String name, List<String> deviceIds) async {
    final groupId = 'group${_speakerGroups.length + 1}';
    final newGroup = SpeakerGroup(
      id: groupId,
      name: name,
      deviceIds: deviceIds,
    );
    
    _speakerGroups = [..._speakerGroups, newGroup];
    notifyListeners();
    return true;
  }
  
  // Delete a speaker group
  Future<bool> deleteSpeakerGroup(String groupId) async {
    _speakerGroups = _speakerGroups.where((group) => group.id != groupId).toList();
    notifyListeners();
    return true;
  }
}
