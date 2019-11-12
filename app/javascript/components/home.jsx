import React from "react";
import { merge } from "lodash";
import ExternalHeader from "./external_header";
import LoginForm from "./session/login_form";

class Home extends React.Component {

    render() {
        return (
            <div>
                <ExternalHeader/>
                <LoginForm/>
            </div>
        );
    }
}

export default Home;
