/* global exports */
"use strict";

// module Mustache

exports.name = require("mustache").name;

exports.version = require("mustache").version;

exports.tags = require("mustache").tags;

exports.parse = function(template) {
    return function(tags) {
        return function() {
            return require("mustache").parse(template, tags);
        };
    };
};

exports.render = function(template) {
    return function(view) {
        return function(partials) {
            return function() {
                return require("mustache").render(template, view, partials);
            };
        };
    };
};

exports.escape = function(s) {
    return require("mustache").escape(s);
}

exports.clearCache = function() {
    return function() {
        return require("mustache").clearCache();
    };
};

exports.showTokenElementImpl = function(e) {
    return e;
}
