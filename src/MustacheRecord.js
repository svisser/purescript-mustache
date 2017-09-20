
exports.render = function(template) {
    return function(view) {
        return function() {
            return require("mustache").render(template, view);
        };
    };
};

exports.renderP = function(template) {
    return function(viewP) {
        return function() {
            return require("mustache").render(template, viewP.view, viewP.partials);
        };
    };
};
