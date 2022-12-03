class_name ContentRegistry
extends Node


enum ContentType {
	CORE,
	EXTENSION,
	TRACKS,
	WEAPON,
	};
var _content_types: Array[String] = [
	"cores",
	"extensions",
	"tracks",
	"weapons",
];
var _content: Dictionary = {
	"cores": {},
	"extensions": {},
	"tracks": {},
	"weapons": {},
	};

