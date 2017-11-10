window.onload = function() {
    class Sauron extends React.Component {
        handleChange = (e) => {
            this.setState({ searchString:e.target.value });
        },

        render() {
            return React.createElement('h1', null, 'Greetings, ' + this.props.name + '!');
        }
    }

    ReactDOM.render(
        React.createElement(Sauron, { name : 'Chris' }),
        document.getElementById('root')
    );
};
