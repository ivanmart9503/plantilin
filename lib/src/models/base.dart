abstract class BaseModel {
  String topic = '';
  String message = '';
}

class Temperature extends BaseModel {}

class Humidity extends BaseModel {}

class Ground extends BaseModel {}

class Sprinkler extends BaseModel {}
