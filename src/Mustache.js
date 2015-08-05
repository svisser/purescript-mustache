/* global exports */
"use strict";

// module Mustache

exports.name = Mustache.name;

exports.version = Mustache.version;

exports.tags = Mustache.tags;

exports.parse = function(template) {
    return function(tags) {
        return Mustache.parse(template, tags);
    };
};

exports.render = function(template) {
    return function(view) {
        return function(partials) {
            return Mustache.render(template, view, partials);
        };
    };
};
