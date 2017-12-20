import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { Button } from 'semantic-ui-react'

const ButtonExampleButton = () => (
    <Button>Click Here</Button>
)

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <ButtonExampleButton name="React" />,
        document.body.appendChild(document.createElement('div')),
    )
})

// export default ButtonExampleButton